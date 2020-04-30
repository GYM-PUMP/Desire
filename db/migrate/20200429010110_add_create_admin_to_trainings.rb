class AddCreateAdminToTrainings < ActiveRecord::Migration[5.2]
  def change
    add_column :trainings, :create_admin, :boolean, default: true, null: false
  end
end