class RemoveSourcesTable < ActiveRecord::Migration
  def up
  	drop_table :sources
  end

  def down
  	create_table :sources do |t|
      t.string :name
      t.string :location
      t.text :description
      t.timestamps
    end
  end
end
