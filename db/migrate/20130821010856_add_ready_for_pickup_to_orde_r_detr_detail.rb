class AddReadyForPickupToOrdeRDetrDetail < ActiveRecord::Migration
  def up
  	add_column :order_details, :ready_for_pickup, :boolean, default: false
  end
end
