class DeleteMembers < ActiveRecord::Migration
  def up
    drop_table :members
  end

  def down
  end
end
