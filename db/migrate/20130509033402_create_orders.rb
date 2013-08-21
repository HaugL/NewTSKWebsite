class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.integer :member_id
      t.decimal :cost
      t.boolean :paid
      t.integer :payment_method_id
      t.timestamps
    end
  end


  def down
  	drop_table :orders
  end
end
