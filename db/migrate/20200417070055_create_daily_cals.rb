class CreateDailyCals < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_cals do |t|
    	t.integer :user_id
		t.integer :total_ingestion_cal
		t.integer :total_protein
		t.integer :total_fat
		t.integer :total_carb
		t.integer :total_consumption_cal
		t.integer :result_cal
		t.integer :weight
        t.timestamps
    end
  end
end
