class DaysOfWeek < ActiveRecord::Migration
  def up
	create_table :days do |t|
      t.string :name
    end
  end

  def down
  	drop_table :days
  end
end
