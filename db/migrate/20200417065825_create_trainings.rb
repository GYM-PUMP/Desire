class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      	t.integer :training_genre_id
    		t.string :training_name
    		t.text :training_content
    		t.string :training_image_id
    		t.string :movie_url
    		t.integer :consumed_cal
        t.timestamps
    end
  end
end
