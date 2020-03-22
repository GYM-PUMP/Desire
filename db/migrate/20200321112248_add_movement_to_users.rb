class AddMovementToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :movement, :float, default: 1.2, null: false
    remove_column :users, :exercise_quantity, :integer, default: 0, null: false
  end
end
