class AddGymUrlToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :gym_url, :text
  end
end
