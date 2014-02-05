class RemoveAdminOrdersTable < ActiveRecord::Migration
  def up
  	drop_table :admin_orders
  end

  def down
  	create_table :admin_orders do |t|
      t.decimal :quantity
      t.integer :product_id
      t.boolean :ready_for_pickup, default: false
      t.timestamps
    end
  end
end
