class RemoveDaysTable < ActiveRecord::Migration
  def up
  	drop_table :days
  end

  def down
  	create_table :days do |t|
      t.string :name
    end
  end
end
