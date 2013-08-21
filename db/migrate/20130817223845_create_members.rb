class CreateMembers < ActiveRecord::Migration
  def up
    create_table :members do |t|
      t.string :email
      t.boolean :admin, default: false
      t.boolean :deactivated, default: false
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end

  def down
  	drop_table :members
  end
end
