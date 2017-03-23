class CreateRumieGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :rumie_groups do |t|
      t.string :group_name
      t.text :description
      t.integer :creator_id, null: false

      t.timestamps null: false
    end
  end
end
