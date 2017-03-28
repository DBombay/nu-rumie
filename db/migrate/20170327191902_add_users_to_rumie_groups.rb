class AddUsersToRumieGroups < ActiveRecord::Migration[5.0]
  def up
    add_reference :rumie_groups, :users, index: true
  end

  def down
    remove_reference :rumie_groups, :users
  end
end
