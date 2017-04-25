class AddBudgetToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :budget, :integer, numericality: true
  end

  def down
    remove_column :users, :budget
  end
end
