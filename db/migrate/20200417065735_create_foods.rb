class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
		t.integer :food_genre_id
		t.string :food_name
		t.string :food_content
		t.string :food_image_id
		t.integer :ingestion_cal
		t.integer :protein
		t.integer :fat
		t.integer :carb
	    t.timestamps
    end
  end
end
