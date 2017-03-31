class AddDesiredCityToRumieGroup < ActiveRecord::Migration[5.0]
  def up
    add_column :rumie_groups, :city, :string, null: false
    add_column :rumie_groups, :state, :string, null: false
  end

  def down
    remove_column :rumie_groups, :city
    remove_column :rumie_groups, :state
  end
end
