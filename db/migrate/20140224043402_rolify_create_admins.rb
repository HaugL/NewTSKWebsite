class RolifyCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:members_admins, :id => false) do |t|
      t.references :member
      t.references :admin
    end

    add_index(:admins, :name)
    add_index(:admins, [ :name, :resource_type, :resource_id ])
    add_index(:members_admins, [ :member_id, :admin_id ])
  end
end
