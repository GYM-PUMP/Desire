class CreateSelectDailyCals < ActiveRecord::Migration[5.2]
  def change
    create_table :select_daily_cals do |t|
    	t.integer :training_id
    	t.integer :training_quantity
		t.integer :food_id
		t.integer :food_quantity
		t.integer :daily_cal_id
      	t.timestamps
    end
  end
end
