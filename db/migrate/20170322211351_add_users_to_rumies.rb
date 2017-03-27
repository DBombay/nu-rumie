class AddUsersToRumies < ActiveRecord::Migration[5.0]
  def up
    add_reference :users, :rumie_group, index: true
  end

  def down
    remove_reference :users, :rumie_group
  end
end
