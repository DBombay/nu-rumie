class AddMaxUsersToRumieGroups < ActiveRecord::Migration[5.0]
  safety_assured
  
  def up
    add_column :rumie_groups, :max_users, :integer, default: '1'
  end

  def down
    remove_column :rumie_groups, :max_users
  end
end
