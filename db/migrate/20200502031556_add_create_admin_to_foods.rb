class AddCreateAdminToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :create_admin, :boolean, default: true, null: false
    add_column :foods, :user_id, :integer
  end
end
