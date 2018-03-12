class AddCompanyToLandlords < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :company, :string
  end

  def down
    remove_column :users, :company
  end
end
