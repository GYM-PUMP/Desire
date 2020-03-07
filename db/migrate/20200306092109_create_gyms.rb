class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :gym_name
	  t.text :description
	  t.string :image_id
	  t.integer :postal_code
	  t.string :address
	  t.float  :latitude
	  t.float  :longitude
      t.timestamps
    end
  end
end
