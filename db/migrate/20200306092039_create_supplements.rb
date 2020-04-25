class CreateSupplements < ActiveRecord::Migration[5.2]
  def change
    create_table :supplements do |t|
	  t.integer :genre_id
	  t.string :item_name
	  t.text :description
	  t.integer :price
	  t.string :maker
	  t.string :supple_image_id
	  t.text :sales_target_url
	  t.timestamps
    end
  end
end
