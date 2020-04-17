class CreateTrainingGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :training_genres do |t|
    	t.string :training_genre_name
		t.string :training_genre_image_id
        t.timestamps
    end
  end
end
