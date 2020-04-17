class CreateFoodGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :food_genres do |t|
    	t.string :food_genre_name
		t.string :food_genre_image_id
        t.timestamps
    end
  end
end
