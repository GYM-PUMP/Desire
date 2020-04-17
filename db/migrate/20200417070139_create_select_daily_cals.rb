class CreateSelectDailyCals < ActiveRecord::Migration[5.2]
  def change
    create_table :select_daily_cals do |t|
    	t.integer :daily_cals_id
		t.integer :training_id
		t.integer :food_id
		t.integer :ingestion_cal
		t.integer :protein
		t.integer :fat
		t.integer :carb
		t.integer :consumption_cal
		t.integer :food_quantity
		t.integer :training_quantity
        t.timestamps
    end
  end
end
