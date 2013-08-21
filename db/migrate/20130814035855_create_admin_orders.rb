class CreateAdminOrders < ActiveRecord::Migration
  def up
  	create_table :admin_orders do |t|
      t.decimal :quantity
      t.integer :product_id
      t.boolean :ready_for_pickup, default: false
      t.timestamps
    end
  end

  def down
  	drop_table :admin_orders
  end
end
