class CreateProducts < ActiveRecord::Migration
    def up
  	    create_table :products do |t|
  	      t.string :name
  	      t.integer :unit_id
  	      t.decimal :price_per_unit
	      t.timestamps
	    end
  end

  def down
  	drop_table :products
  end
end
