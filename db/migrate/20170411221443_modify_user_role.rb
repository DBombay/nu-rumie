class ModifyUserRole < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :admin
    add_column :users, :role, :string, null: false, default: "renter"
  end

  def down
    remove_column :users, :role
    add
  end
end
