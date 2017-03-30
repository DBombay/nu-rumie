class AddAboutFeaturesToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :about_personality, :text
    add_column :users, :about_career, :text
    add_column :users, :about_preferences, :text
  end

  def down
    remove_column :users, :about_personality
    remove_column :users, :about_career
    remove_column :users, :about_preferences
  end
end
