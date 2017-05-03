class ModifyUserRole < ActiveRecord::Migration[5.0]
  safety_assured
  
  def up
    remove_column :users, :admin
    add_column :users, :role, :string, null: false, default: "renter"
  end

  def down
    remove_column :users, :role
    add_column :users, :admin, :boolean, null: false, default: "false"
  end
end
