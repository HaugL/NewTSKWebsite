class CreateOrderDetails < ActiveRecord::Migration
  def up
  	    create_table :order_details do |t|
	      t.integer :order_id
	      t.integer :quantity 
	      t.integer :product_id
	      t.timestamps
	    end
  end

  def down
  	drop_table :order_details
  end
end
