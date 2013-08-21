class CreateSources < ActiveRecord::Migration
  def up
    create_table :sources do |t|
      t.string :name
      t.string :location
      t.text :description
      t.timestamps
    end
  end
end
