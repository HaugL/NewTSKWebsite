class RemovePaidFromOrders < ActiveRecord::Migration
  def up
  	remove_column :orders, :paid
  end

  def down
  end
end
