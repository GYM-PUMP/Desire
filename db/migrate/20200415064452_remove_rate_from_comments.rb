class RemoveRateFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :rate, :float
  end
end
