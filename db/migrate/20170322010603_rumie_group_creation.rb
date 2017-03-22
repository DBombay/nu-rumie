class RumieGroupCreation < ActiveRecord::Migration[5.0]
  def change
    create_table :rumies do |t|
      t.string :group_name, presence: true
    end
  end
end
