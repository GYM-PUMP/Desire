class RemoveGymIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :gym_id, :integer
  end
end
