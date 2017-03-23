class AddUsersToRumies < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :rumie_group, :integer, default: 'nil'
  end

  def down
    remove_column :users, :rumie_group
  end
end
