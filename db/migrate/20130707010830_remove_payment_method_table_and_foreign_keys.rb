class RemovePaymentMethodTableAndForeignKeys < ActiveRecord::Migration
  def up
  	remove_column :orders, :payment_method_id
  end

  def down
  end
end
