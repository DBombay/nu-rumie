class AddDesiredCityToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
  end

  def down
    remove_column :users, :city
    remove_column :users, :state
  end
end
